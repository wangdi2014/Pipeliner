rule all_exomeseq_somatic:
    input:  expand("{s}"+".realign.bam",s=samples),
#            expand("mutect2_out/{p}"+".FINAL.vcf",p=pairs),
#            expand("mutect2_out/chrom_files/{p}_{CHROM}.vcf",p=pairs,CHROM=config['references'][pfamily]['CHROMS']),
            expand("mutect_out/{p}"+".FINAL.vcf",p=pairs),
            expand("strelka_out/{p}"+".vcf",p=pairs),
#            expand("mutect2_out/oncotator_out/{p}"+".maf",p=pairs),
            expand("strelka_out/oncotator_out/{p}"+".maf",p=pairs),
            expand("mutect_out/oncotator_out/{p}"+".maf",p=pairs),
            "mutect_out/oncotator_out/mutect_variants_alview.input",
            "strelka_out",
#            "mutect2_out",
            "cnvkit_out",
            "mutect_out",
            "delly_out",
            "germline_snps.vcf",
#            expand("cnvkit_out/{p}_diagram.pdf", p=pairs),
#            expand("cnvkit_out/{p}_scatter.pdf", p=pairs),
            expand("cnvkit_out/{p}_calls.cns", p=pairs),
            expand("cnvkit_out/{p}_gainloss.tsv", p=pairs),                        
            expand("delly_out/{p}_del.bcf", p=pairs),
            expand("delly_out/{p}_ins.bcf", p=pairs),
            expand("delly_out/{p}_dup.bcf", p=pairs),
            expand("delly_out/{p}_tra.bcf", p=pairs),
            expand("delly_out/{p}_inv.bcf", p=pairs),
            "mutect_out/merged_somatic.vcf",
            "mutect_out/merged_somatic_snpEff.vcf",
#            "mutect2_out/merged_somatic.vcf",
#            "mutect2_out/merged_somatic_snpEff.vcf",
            "variants.bed",
            "full_annot.txt.zip",
            "sample_network.bmp",
            "variants.database",
#            "mutect2_out/oncotator_out/mutect2_variants.maf",
#            "mutect2_out/mutsigCV_out/somatic.sig_genes.txt",
            "strelka_out/oncotator_out/strelka_variants.maf",
            "strelka_out/mutsigCV_out/somatic.sig_genes.txt",
            "mutect_out/oncotator_out/mutect_variants.maf",
            "mutect_out/mutsigCV_out/somatic.sig_genes.txt"
    output:
    params: rname="final"
    shell:  """
             mv *.out slurmfiles/

            """