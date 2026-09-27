	.include "macro.inc"

	.syntax unified

	thumb_func_start GetCurrentBgmSong
GetCurrentBgmSong: @ 0x080034DC
	push {r7, lr}
	mov r7, sp
	ldr r0, _080034E8 @ =0x02024E1C
	ldrh r1, [r0, #4]
	adds r0, r1, #0
	b _080034EC
	.align 2, 0
_080034E8: .4byte 0x02024E1C
_080034EC:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
