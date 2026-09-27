	.include "macro.inc"

	.syntax unified

	thumb_func_start StartTitleScreen_FlagFalse
StartTitleScreen_FlagFalse: @ 0x080BAAF4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BAB08 @ =0x08CEEF6C
	bl Proc_StartBlocking
	adds r0, #0x51
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080BAB08: .4byte 0x08CEEF6C
