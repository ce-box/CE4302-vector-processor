namespace GEO
{
    static class Extensions
    {
        private const int BASE = 2;
        public static string ToBinaryString(this int value, int lenght)
        {
            string result = Convert.ToString(value, BASE);
                
            switch (result.Length)
            {
                case int resultLenght when resultLenght > lenght:
                    return result.PadLeft(lenght);
                case int resultLenght when resultLenght < lenght:
                    return result.PadLeft(lenght, '0');
                case int resultLenght when resultLenght == lenght:
                    return result;
            }

            throw new Exception("Oops, something happened!");
        }
    }
}
