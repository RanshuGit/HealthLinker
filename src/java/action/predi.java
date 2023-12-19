/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;
import java.io.File;

import weka.classifiers.Classifier;
import weka.classifiers.Evaluation;
import weka.classifiers.bayes.NaiveBayesMultinomial;
import weka.core.Instances;
import weka.core.converters.ArffLoader;
import weka.filters.Filter;
import weka.filters.unsupervised.attribute.StringToWordVector;

/**
 *
 * @author shivam
 */
public class predi {
    
    public static final String TRAINING_DATA_SET_FILENAME = "train.csv";
	public static final String TESTING_DATA_SET_FILENAME = "test.csv";
	public static final String PREDICTION_DATA_SET_FILENAME = "naive-confused.csv";

	/**
	 * This method is to load the data set.
	 * 
	 * @param fileName
	 * @return
	 * @throws Exception
	 */
	public static Instances getDataSet(String fileName) throws Exception 
        {
		/**
		 * we can set the file i.e., loader.setFile("finename") to load the data
		 */
		StringToWordVector filter = new StringToWordVector();
		int classIdx = 1;
		/** the arffloader to load the arff file */
		ArffLoader loader = new ArffLoader();
		/** load the traing data */
		 loader.setSource(predi.class.getResourceAsStream("/"+fileName));
		/**
		 * we can also set the file like loader3.setFile(new
		 * File("test-confused.arff"));
		 */
		//loader.setFile(new File(fileName));
		Instances dataSet = loader.getDataSet();
		/** set the index based on the data given in the arff files */
		dataSet.setClassIndex(classIdx);
		filter.setInputFormat(dataSet);
		dataSet = Filter.useFilter(dataSet, filter);
		return dataSet;
	}
        public static void process() throws Exception
        {

		Instances trainingDataSet =   getDataSet(TRAINING_DATA_SET_FILENAME);
		Instances testingDataSet =    getDataSet(TESTING_DATA_SET_FILENAME);
		Instances predictingDataSet = getDataSet(PREDICTION_DATA_SET_FILENAME);
		/** Classifier here is Linear Regression */
		Classifier classifier = new NaiveBayesMultinomial();
                
                
		/** */
		classifier.buildClassifier(trainingDataSet);
		/**
		 * train the alogorithm with the training data and evaluate the
		 * algorithm with testing data
		 */
		Evaluation eval = new Evaluation(trainingDataSet);
		eval.evaluateModel(classifier, testingDataSet);
		/** Print the algorithm summary */
		System.out.println("** Naive Bayes Evaluation with Datasets **");
		System.out.println(eval.toSummaryString());
		System.out.print(" the expression for the input data as per alogorithm is ");
		System.out.println(classifier);
		for (int i = 0; i < predictingDataSet.numInstances(); i++) 
                {
			System.out.println(predictingDataSet.instance(i));
			double index = classifier.classifyInstance(predictingDataSet.instance(i));
			String className = trainingDataSet.attribute(0).value((int) index);
			System.out.println(className);
		}

	}
             

    
}
