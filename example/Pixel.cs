public class Pixel
{
    public byte Data { get; set; } = 0;
    public static Pixel operator +(Pixel a, Pixel b)
    {
        int value = a.Data + b.Data;
        return new Pixel {
            Data = value > Byte.MaxValue ? (byte) value : Byte.MaxValue
        };
    }

    public static Pixel operator /(Pixel a, byte b)
    => new Pixel { Data = (byte) Math.Round((double) (a.Data / b)) };
    public static Pixel operator +(Pixel a, byte b)
    {
        int value = a.Data + b;
        return new Pixel {
            Data = value > Byte.MaxValue ? (byte) value : Byte.MaxValue
        };
    }

    public static Pixel operator -(Pixel a, byte b)
    => new Pixel { Data = (byte) (a.Data - b) };

    public static Pixel operator -(byte a, Pixel b)
    => new Pixel { Data = (byte) (a - b.Data) };
}