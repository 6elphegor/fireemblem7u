	.include "macro.inc"

	.syntax unified

	thumb_func_start StartChapterStatusScreen_FromPrep
StartChapterStatusScreen_FromPrep: @ 0x080871C8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080871DC @ =0x08CC2F58
	bl Proc_StartBlocking
	adds r0, #0x3f
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080871DC: .4byte 0x08CC2F58
