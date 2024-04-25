package testrunner;
import com.intuit.karate.junit5.Karate;

public class runner
{
    String myprojectpath = System.getProperty("user.dir").toString();

    //validate website get urls
    @Karate.Test
    Karate testSample_REST()
    {
        return Karate.run(myprojectpath+"/src/test/featurefiles/postcalllearn.feature");
    }

}
