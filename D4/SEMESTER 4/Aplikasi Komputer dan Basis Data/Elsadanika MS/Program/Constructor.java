class Constructor{
    public class User{
        public String username;
        public String password;
        public User(String username, String password){
            this.username = username;
            this.password = password;
        }
    }
}
class konstruktor{
    public static void main(String[] args){
        User petani = new User("petani");
        System.out.println("Username: "+petani.username);
        System.out.println("Password: "+petani.password);
    }
}