	.include "macro.inc"

	.syntax unified

	thumb_func_start PutChapterTitleBgUnkTsa
PutChapterTitleBgUnkTsa: @ 0x08082480
	push {lr}
	adds r2, r1, #0
	ldr r1, _0808249C @ =0x0840213C
	ldr r3, _080824A0 @ =0x0203E698
	lsls r2, r2, #0xc
	ldrh r3, [r3]
	adds r2, r3, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl TmApplyTsa_thm
	pop {r0}
	bx r0
	.align 2, 0
_0808249C: .4byte 0x0840213C
_080824A0: .4byte 0x0203E698
