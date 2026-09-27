	.include "macro.inc"

	.syntax unified

	thumb_func_start StartTitleScreen_FlagTrue
StartTitleScreen_FlagTrue: @ 0x080BAB0C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BAB20 @ =0x08CEEF6C
	bl Proc_StartBlocking
	adds r0, #0x51
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080BAB20: .4byte 0x08CEEF6C
