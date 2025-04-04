public class Enemy 
{
    int room;
    String[] roomNames;

    Enemy()
    {
        roomNames = new String[9];
        roomNames[0] = "home";
        roomNames[1] = "temp";
        roomNames[2] = "programs";
        roomNames[3] = "active";
        roomNames[4] = "utilities";
        roomNames[5] = "phrog";
        roomNames[6] = "downloads";
        roomNames[7] = "imports";
        roomNames[8] = "pcloud";
    }

    String getRoom()
    {
        return roomNames[room];  
    }
}
