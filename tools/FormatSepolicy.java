import java.io.*;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.TreeSet;

public class FormatSepolicy {
    /**
     * get file list
     *
     * @param path the file path
     * @return success return Files list
     */
    File[] getList(String path) {
        File dir;
        File[] files;

        // use path to get dir
        if (!((dir = new File(path)).isDirectory())) return null;

        // get file list
        if ((files = dir.listFiles()) != null) System.out.println("Get list success");

        return files;
    }

    /**
     * formatRule
     */
    boolean isAccordWithFormatRule(String string, boolean allowEmpty, boolean allowNotes) {
        boolean flag = true;
        if (!allowEmpty && string.isEmpty()) flag = false;
        if (!allowNotes && string.startsWith("#")) flag = false;
        return flag;
    }

    /**
     * format a file according to rule
     */
    void formatFile(File file, boolean allowEmpty, boolean allowNotes) throws IOException {
        // source file
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(Files.newInputStream(file.toPath())));
        BufferedWriter bufferedWriter;

        // use tree set to store text and let tree set can compare string by first char at the string
        TreeSet<String> treeSet = new TreeSet<>((s, t) -> {
            // s first char > t first char return -1
            int value = (int) s.charAt(0) - (int) t.charAt(0);
            if (value < 0) return 1;
            else if (value > 0) return -1;

            if (s.equals(t)) return 0;

            return 1;
        });

        while (true) {
            String string = bufferedReader.readLine();
            if (string == null) break;

            // if not accord with rule will ignore
            if (!isAccordWithFormatRule(string, allowEmpty, allowNotes)) continue;

            treeSet.add(string);
        }
        bufferedReader.close();

        // write back to file
        bufferedWriter = new BufferedWriter(new OutputStreamWriter(Files.newOutputStream(file.toPath())));
        for (String next : treeSet) {
            bufferedWriter.write(next);
            bufferedWriter.newLine();
            bufferedWriter.flush();
        }
        bufferedWriter.close();
    }

    /**
     * format files
     *
     * @param dir target directory
     */
    void format(String dir) throws IOException {
        File[] list = getList(dir);

        ArrayList<File> teList = new ArrayList<>();

        if (list == null) return;

        // get selinux config file object to arraylist
        for (File file : list) {
            if (file.getName().endsWith("te")) {
                teList.add(file);
            }
        }

        // format every files
        for (File file : teList) {
            System.out.println("Format -> " + file.getName());
            formatFile(file, false, false);
        }

        // delete empty file
        for (File file : teList) {
            if (file.length() == 0 && file.getName().endsWith(".te") && file.delete()) {
                System.out.println("Delete empty file");
            }
        }
    }

    public static void main(String[] args) throws IOException {
        if (args.length == 0) new FormatSepolicy().format(".");
    }
}