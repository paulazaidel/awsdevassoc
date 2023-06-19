import { SFNClient, SendTaskSuccessCommand } from "@aws-sdk/client-sfn";

const client = new SFNClient({});

export const handler = async(event, context) => {
    console.log("Context: " + JSON.stringify(context));
    console.log("Event: " + JSON.stringify(event));
    
    // Input to SendTaskSuccess
    // Output is the output from the function execution
    const input = { 
      taskToken: event.taskToken,
      output: JSON.stringify({Payload: {isVio: false, foo: 1, bar: "two"}}) 
    };
    
    console.log("Returning: " + JSON.stringify(input));
    
    const command = new SendTaskSuccessCommand(input);
    const response = await client.send(command);
    
};

