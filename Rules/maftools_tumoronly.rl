rule maftools_tumoronly:
  input: mutect2mafs=expand(config['project']['workpath']+"/mutect2_out/oncotator_out/{s}.maf",s=samples),
  output: mutect2maf=config['project']['workpath']+"/mutect2_out/oncotator_out/mutect2_filtered.maf",
          mutect2summary=config['project']['workpath']+"/mutect2_out/mutect2_maf_summary.pdf",
          mutect2oncoprint=config['project']['workpath']+"/mutect2_out/mutect2_oncoplot.pdf",
  params: dir=config['project']['workpath'],rname="pl:maftools"
  shell: "cat mutect2_out/oncotator_out/*.maf > mutect2_out/oncotator_out/mutect2_variants.maf; perl Scripts/prep_mafs.pl mutect2_out/oncotator_out/mutect2_variants.maf mutect2; module load R/3.5; Rscript Scripts/maftools.R {params.dir}/mutect2_out/oncotator_out/ mutect2_filtered.maf {params.dir}/mutect2_out/mutect2_maf_summary.pdf {output.mutect2oncoprint}"