import os
import htcondor
from mass_grid import Mass_BKK_R 

outputdir =  '/scratch365/atownse2/KKTriPhoton/SignalGEN/gridpacks/'

#Run condor jobs/they should output to the output directories
for M_BKK,M_R in Mass_BKK_R: 
  fragment = "Res1ToRes2GluToGluVV_M1-%s_R-%s"%(str(M_BKK),str(M_R))

  frag_out = outputdir+fragment+"/"
  
  if not os.path.isdir(frag_out):
    os.makedirs(frag_out)

  make_gridpack = htcondor.Submit({
      "executable": "run_gridpack.sh",
      "arguments": "{} {} {}".format(M_BKK, M_R, frag_out),
      "output": "out/"+fragment+".out",
      "error" : "err/"+fragment+".err",
      "log"   : "log/"+fragment+".log",              
      "request_cpus": "1",
      "request_memory": "128MB",
      "request_disk": "128MB",
  })

  print("Submitting job for fragment: " + fragment)
  schedd = htcondor.Schedd()
  submit_result = schedd.submit(make_gridpack)
