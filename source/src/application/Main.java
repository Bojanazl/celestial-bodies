package application;
import application.view.*;

import java.awt.event.ActionEvent;
import java.io.FileInputStream;
import java.io.IOException;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.stage.Modality;
import javafx.stage.Stage;
import application.Main;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TableView;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;

import javafx.scene.control.TextField;
public class Main extends Application {
	
	private static Stage primaryStage;
	private static BorderPane mainLayout;

	@Override
	public void start(Stage primaryStage) throws IOException {
		this.primaryStage = primaryStage;
		this.primaryStage.setTitle("Ntio App");
		
		try {
			BorderPane root = new BorderPane();
			Scene scene = new Scene(root);//-----size------//
			scene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());
			primaryStage.setScene(scene);
			primaryStage.show();
		} catch(Exception e) {
			e.printStackTrace();
		}
		showMainView();
		showMainItems();
	}
	

	public void showMainView() throws IOException {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(Main.class.getResource("view/MainView.fxml"));
		mainLayout = loader.load();
		Scene scene = new Scene(mainLayout);/*--*/
		primaryStage.setScene(scene);
		primaryStage.show();
	}
		
	public static void showMainItems() throws IOException {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(Main.class.getResource("view/MainItems.fxml"));
		BorderPane mainItems = loader.load();
		mainLayout.setCenter(mainItems);
	}
		
	public static void showAzurirajBazuScene() throws IOException {
		FXMLLoader loader = new FXMLLoader () ;
		loader.setLocation(Main.class.getResource("view/AzurirajBazu.fxml"));
		BorderPane azurirajB = loader.load();
		mainLayout.setCenter(azurirajB);
	}
	
	public static void showDodajNovuZvijezduScene() throws IOException {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(Main.class.getResource("view/DodajZvijezdu.fxml"));
		BorderPane dodajZ = loader.load();
		
		application.view.DodajZvijezduController con = loader.getController();
		
		Stage addDialogStage = new Stage() ;
		addDialogStage.setTitle("Dodaj Zvijezdu");
		addDialogStage.initModality(Modality.WINDOW_MODAL); //WINDOW_MODAL - zabranjujemo pristup drugim prozorima dok smo u aktivnom prozoru
		addDialogStage.initOwner(primaryStage);
		Scene scene = new Scene(dodajZ);
		addDialogStage.setScene(scene);
		
		con.postaviZvjezdaniSistemUChoiceBox();
		con.postaviVrstuUChoiceBox();
		addDialogStage.showAndWait();
	}
	
	public static void showPrikaziZvijezdeScene() throws IOException {
		FXMLLoader loader = new FXMLLoader() ;
		loader.setLocation(Main.class.getResource("view/IspisiZvijezde.fxml"));
		BorderPane ispisiZ = loader.load();
		
		application.view.IspisZvijezdeController con = loader.getController();
		
		Stage addDialogStage = new Stage() ;
		addDialogStage.setTitle("Pregled Zvijezda");
		addDialogStage.initModality(Modality.WINDOW_MODAL); //WINDOW_MODAL - zabranjujemo pristup drugim prozorima dok smo u aktivnom prozoru
		addDialogStage.initOwner(primaryStage);
		Scene scene = new Scene(ispisiZ);
		addDialogStage.setScene(scene);
		
		con.loadDataFromDatabase();
		addDialogStage.showAndWait();
		}
	
	public static void showIspisiZvijezdeScene() throws IOException {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(Main.class.getResource("view/IspisiZvijezde.fxml"));
		
		BorderPane ispisiZ = loader.load();
		application.view.IspisZvijezdeController con = loader.getController();
		
		Stage addDialogStage = new Stage() ;
		addDialogStage.setTitle("Lista zvijezda");
		addDialogStage.initModality(Modality.WINDOW_MODAL); //WINDOW_MODAL - zabranjujemo pristup drugim prozorima dok smo u aktivnom prozoru
		addDialogStage.initOwner(primaryStage);
		Scene scene = new Scene(ispisiZ);
		addDialogStage.setScene(scene);
		
		con.loadDataFromDatabase();
		addDialogStage.showAndWait();
	}

	public static void showDodajNovuPlanetuScene() throws IOException {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(Main.class.getResource("view/DodajPlanetu.fxml"));
		BorderPane dodajP = loader.load();
		
		application.view.DodajPlanetuController con = loader.getController();
		
		Stage addDialogStage = new Stage() ;
		addDialogStage.setTitle("Dodaj Novu Planetu");
		addDialogStage.initModality(Modality.WINDOW_MODAL); //WINDOW_MODAL - zabranjujemo pristup drugim prozorima dok smo u aktivnom prozoru
		addDialogStage.initOwner(primaryStage);
		Scene scene = new Scene(dodajP);
		addDialogStage.setScene(scene);
		
		con.postaviTipUChoiceBox();
		addDialogStage.showAndWait();
	}
	
	public static void showIspisiPlaneteScene() throws IOException {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(Main.class.getResource("view/IspisiPlanete.fxml"));
		
		BorderPane ispisiP = loader.load();
		application.view.IspisiPlanetuController con = loader.getController();
		
		Stage addDialogStage = new Stage() ;
		addDialogStage.setTitle("Lista planeta");
		addDialogStage.initModality(Modality.WINDOW_MODAL); //WINDOW_MODAL - zabranjujemo pristup drugim prozorima dok smo u aktivnom prozoru
		addDialogStage.initOwner(primaryStage);
		Scene scene = new Scene(ispisiP);
		addDialogStage.setScene(scene);
		
		con.loadDataFromDatabase();
		addDialogStage.showAndWait();
	}

	public static void showDodajNovuCrnuRupuScene() throws IOException {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(Main.class.getResource("view/DodajCrnuRupu.fxml"));
		BorderPane dodajCR = loader.load();
		
		application.view.DodajCrnuRupuController con = loader.getController();
		
		Stage addDialogStage = new Stage() ;
		addDialogStage.setTitle("Dodaj Crnu Rupu");
		addDialogStage.initModality(Modality.WINDOW_MODAL); //WINDOW_MODAL - zabranjujemo pristup drugim prozorima dok smo u aktivnom prozoru
		addDialogStage.initOwner(primaryStage);
		Scene scene = new Scene(dodajCR);
		addDialogStage.setScene(scene);
		
		con.postaviGalaksijeUChoiceBox();
		addDialogStage.showAndWait();
	}
	
	
	public static void showIspisiCrneRupeScene() throws IOException {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(Main.class.getResource("view/IspisiCrnuRupu.fxml"));
		
		BorderPane ispisiCR = loader.load();
		
		application.view.IspisiCrnuRupuController con = loader.getController();
		
		Stage addDialogStage = new Stage() ;
		addDialogStage.setTitle("Lista crnih rupa");
		addDialogStage.initModality(Modality.WINDOW_MODAL); //WINDOW_MODAL - zabranjujemo pristup drugim prozorima dok smo u aktivnom prozoru
		addDialogStage.initOwner(primaryStage);
		Scene scene = new Scene(ispisiCR);
		addDialogStage.setScene(scene);
		
		con.loadDataFromDatabase();
		addDialogStage.showAndWait();

	}
	

	public static void showDodajNoviPrirodniSatelitScene() throws IOException {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(Main.class.getResource("view/DodajPrirodniSatelit.fxml"));
		BorderPane dodajPS = loader.load();
		
		application.view.DodajPrirodniSatelitController con = loader.getController();
		
		Stage addDialogStage = new Stage() ;
		addDialogStage.setTitle("Dodaj prirodni satelit");
		addDialogStage.initModality(Modality.WINDOW_MODAL); //WINDOW_MODAL - zabranjujemo pristup drugim prozorima dok smo u aktivnom prozoru
		addDialogStage.initOwner(primaryStage);
		Scene scene = new Scene(dodajPS);
		addDialogStage.setScene(scene);
		
		con.postaviRoditeljaUChoiceBox();
		con.postaviVrstuUChoiceBox();
		addDialogStage.showAndWait();
	}
	
	public static void showIspisiPriodniSatelitScene() throws IOException {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(Main.class.getResource("view/IspisiPrirodneSatelite.fxml"));
		
		BorderPane ispisiPS = loader.load();
		
		application.view.IspisiPrirodniSatelitController con = loader.getController();
		
		Stage addDialogStage = new Stage() ;
		addDialogStage.setTitle("Sateliti i maticna tijela");
		addDialogStage.initModality(Modality.WINDOW_MODAL); //WINDOW_MODAL - zabranjujemo pristup drugim prozorima dok smo u aktivnom prozoru
		addDialogStage.initOwner(primaryStage);
		Scene scene = new Scene(ispisiPS);
		addDialogStage.setScene(scene);
		
		con.loadDataFromDatabase();
		addDialogStage.showAndWait();

	}
	
	public static void showUputstvoScene() throws IOException {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(Main.class.getResource("view/Uputstvo.fxml"));
		BorderPane uputstvo = loader.load();
		
		application.view.DodajZvijezduController con = loader.getController();
		
		Stage addDialogStage = new Stage() ;
		addDialogStage.setTitle("Uputstvo za koristenje aplikacije");
		addDialogStage.initModality(Modality.WINDOW_MODAL); //WINDOW_MODAL - zabranjujemo pristup drugim prozorima dok smo u aktivnom prozoru
		addDialogStage.initOwner(primaryStage);
		Scene scene = new Scene(uputstvo);
		addDialogStage.setScene(scene);
		addDialogStage.showAndWait();
	}
	

	public static void showDefinicije() throws IOException {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(Main.class.getResource("view/Definicije.fxml"));
		BorderPane def = loader.load();
		
		application.view.DodajZvijezduController con = loader.getController();
		
		Stage addDialogStage = new Stage() ;
		addDialogStage.setTitle("Definicije");
		addDialogStage.initModality(Modality.WINDOW_MODAL); //WINDOW_MODAL - zabranjujemo pristup drugim prozorima dok smo u aktivnom prozoru
		addDialogStage.initOwner(primaryStage);
		Scene scene = new Scene(def);
		addDialogStage.setScene(scene);
		addDialogStage.showAndWait();
	}
	public static void main(String[] args) {
		launch(args);
	}


	



	


}
