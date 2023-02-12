using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System.Text;
using Azure.Messaging.EventHubs;

namespace EventProcessingFunction
{
    public static class EventProcessingFunction
    {
        [FunctionName("EventProcessingFunction")]
        public static void Run([EventHubTrigger("telemetries", Connection = "EventHubConnectionAppSetting", ConsumerGroup = "$Default")] EventData[] eventHubMessages, ILogger log)
        {
            foreach (var message in eventHubMessages)
            {
                log.LogInformation($"C# function triggered to process a message: {Encoding.UTF8.GetString(message.EventBody)}");
                log.LogInformation($"EnqueuedTimeUtc={message.EnqueuedTime}");
            }
        }
    }
}
