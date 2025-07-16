include { FASTP } from '../../modules/nf-core/fastp'

workflow {
    take:
        reads
        adapter_fasta
        discard_trimmed_pass
        save_trimmed_fail
        save_merged

    main:
        FASTP(
            reads          = reads,
            adapter_fasta = adapter_fasta,
            discard_trimmed_pass = discard_trimmed_pass,
            save_trimmed_fail = save_trimmed_fail,
            save_merged    = save_merged,
        )

    emit:
        reads_out    = FASTP.out.reads
        reads_fail   = FASTP.out.reads_fail
        reads_merged = FASTP.out.reads_merged
        fastp_html   = FASTP.out.html
        fastp_json   = FASTP.out.json
        log          = FASTP.out.log
        versions     = FASTP.out.versions
}