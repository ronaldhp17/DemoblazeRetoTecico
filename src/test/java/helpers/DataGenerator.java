package helpers;

import com.github.javafaker.Faker;

public class DataGenerator {

    public static String generateRandomUsername() {
        Faker faker = new Faker();
        String username = faker.name().username();

        return username;
    }
    
}
