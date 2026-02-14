import { LightningElement, wire } from "lwc";
import getClientProfiles from "@salesforce/apex/FT_ClientDashboardController.getClientProfiles";

export default class FtClientDashboard extends LightningElement {
  @wire(getClientProfiles)
  clients;
}
