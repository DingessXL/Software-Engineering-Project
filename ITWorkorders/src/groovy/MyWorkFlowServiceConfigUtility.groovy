package adminrequest

class MyWorkFlowServiceConfigUtility{
    Properties myServiceConfigProperties
    
    ///////////////////////////////////////////////////
    ///////////////////////////////////////////////////
    //This value is loaded at init time
    //as specified by the grails-app/conf/resources.groovy file 
    String myConfigFileLocation
    ///////////////////////////////////////////////////
    ///////////////////////////////////////////////////

    ///////////////////////////////////////////////////
    ///////////////////////////////////////////////////
    //if reading the file worked, set to false,
    //otherwise, (application cant work, ~failed state~)
    //set this to true
    boolean failedState
    ///////////////////////////////////////////////////
    ///////////////////////////////////////////////////
        
    def loadConfigurationProperties(String configurationFile ) {
        Properties prop = new Properties();
        try {
            println "trying..."
            FileInputStream inputStream = new FileInputStream( configurationFile );
            prop.load( inputStream );
            inputStream.close();
            println "removing exception...  will it work?"
            prop.remove("exception")
            println "yes, it worked"
            failedState=false
            
        } catch (FileNotFoundException e) {
           println "no, file not found"
           prop.setProperty("exception", "Config File Not Found")
            System.out.println("Configuration file not found: " + configurationFile);
            failedState= true
            //showUsage();
        } catch (IOException e) {
            //showUsage();
            println "no, IOException"
            prop.setProperty("exception", "General IO Exception loading config file")
            e.printStackTrace();
            failedState= true
        }
        catch(all){
            println "no, catch all"
            prop.setProperty("exception", "exception catch all, check config file for MyWorkFlowServiceConfigUtility")
            e.printStackTrace();
            failedState= true
        }
        finally{
            return prop
        }
        
    }
    def setMyServiceConfigProperties(){
        println "inside setter"
        myServiceConfigProperties = loadConfigurationProperties(myConfigFileLocation)
        
    }
    def getMyServiceConfigProperties(){
        if(myServiceConfigProperties == null){
            setMyServiceConfigProperties()
        }
        return myServiceConfigProperties
    }
}