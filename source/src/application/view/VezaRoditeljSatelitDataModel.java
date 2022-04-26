package application.view;

public class VezaRoditeljSatelitDataModel {
	
	private int roditeljID;
	private String imeRoditelja;
	private String vrstaRoditelja;
	private int satelitID;
	private String imeSatelita;
	private String vrstaSatelita;
	


	public VezaRoditeljSatelitDataModel(int roditeljID, String imeRoditelja, String vrstaRoditelja, int satelitID,
			String imeSatelita, String vrstaSatelita) {
		this.roditeljID = roditeljID;
		this.imeRoditelja = imeRoditelja;
		this.vrstaRoditelja = vrstaRoditelja;
		this.satelitID = satelitID;
		this.imeSatelita = imeSatelita;
		this.vrstaSatelita = vrstaSatelita;
	}



	public int getRoditeljID() {
		return roditeljID;
	}



	public void setRoditeljID(int roditeljID) {
		this.roditeljID = roditeljID;
	}



	public String getImeRoditelja() {
		return imeRoditelja;
	}



	public void setImeRoditelja(String imeRoditelja) {
		this.imeRoditelja = imeRoditelja;
	}



	public String getVrstaRoditelja() {
		return vrstaRoditelja;
	}



	public void setVrstaRoditelja(String vrstaRoditelja) {
		this.vrstaRoditelja = vrstaRoditelja;
	}



	public int getSatelitID() {
		return satelitID;
	}



	public void setSatelitID(int satelitID) {
		this.satelitID = satelitID;
	}



	public String getImeSatelita() {
		return imeSatelita;
	}



	public void setImeSatelita(String imeSatelita) {
		this.imeSatelita = imeSatelita;
	}



	public String getVrstaSatelita() {
		return vrstaSatelita;
	}



	public void setVrstaSatelita(String vrstaSatelita) {
		this.vrstaSatelita = vrstaSatelita;
	}
	
	
}
