	.include "macro.inc"

	.syntax unified

	thumb_func_start StartTitleScreen_WithMusic
StartTitleScreen_WithMusic: @ 0x080BAAD4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BAAF0 @ =0x08CEEF6C
	bl Proc_StartBlocking
	adds r0, #0x51
	movs r1, #0
	strb r1, [r0]
	movs r0, #0x5a
	movs r2, #0
	bl StartBgmExt
	pop {r0}
	bx r0
	.align 2, 0
_080BAAF0: .4byte 0x08CEEF6C
