package atg.commerce.pricing;

import atg.service.pipeline.PipelineProcessor;
import atg.service.pipeline.PipelineResult;

public class SampleClass2 implements PipelineProcessor{

	@Override
	public int[] getRetCodes() {
		// TODO Auto-generated method stub
		int[] a = {1};
		return a;
	}

	@Override
	public int runProcess(Object arg0, PipelineResult arg1) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Success Pipeline2!!!!");
		return 1;
	}

}
