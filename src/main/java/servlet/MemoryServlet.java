package servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MemoryServlet", urlPatterns = {"/memories"})
public class MemoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Find the absolute physical path of the memories folder on the server
        String memoriesPath = getServletContext().getRealPath("/assets/memories");
        
        // Map to store Year -> List of Image File Names (Maintains insertion order)
        Map<Integer, List<String>> memoriesMap = new LinkedHashMap<>();
        
        if (memoriesPath != null) {
            // Iterate through years (adjust max year as time goes on, or swap order to show newest first)
            for (int year = 2011; year <= 2026; year++) {
                File yearFolder = new File(memoriesPath, String.valueOf(year));
                
                if (yearFolder.exists() && yearFolder.isDirectory()) {
                    File[] files = yearFolder.listFiles((dir, name) -> {
                        String lower = name.toLowerCase();
                        return lower.endsWith(".jpg") || lower.endsWith(".jpeg") || lower.endsWith(".png");
                    });
                
                    if (files != null && files.length > 0) {
                        List<String> imageList = new ArrayList<>();
                        for (File file : files) {
                            imageList.add(file.getName()); // Keep just the filename
                        }
                        memoriesMap.put(year, imageList);
                    }
                }
            }
        }
        
        request.setAttribute("memoriesMap", memoriesMap);
        request.getRequestDispatcher("/memories.jsp").forward(request, response);
    }
}
