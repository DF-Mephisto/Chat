package app.entities;

public class Msg
{
    private String name;
    private String message;

    public Msg()
    {
        name = "";
        message = "";
    }

    public Msg(String name, String message)
    {
        this.name = name;
        this.message = message;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }

    public void setMessage(String message)
    {
        this.message = message;
    }

    public String getMessage()
    {
        return message;
    }
}
