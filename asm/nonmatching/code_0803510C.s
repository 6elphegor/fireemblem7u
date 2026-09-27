	.include "macro.inc"

	.syntax unified

	thumb_func_start CpPerform_UpdateMapMusic
CpPerform_UpdateMapMusic: @ 0x0803510C
	push {lr}
	ldr r0, _08035120 @ =0x08B85854
	bl Proc_Find
	cmp r0, #0
	bne _0803511C
	bl StartMapSongBgm
_0803511C:
	pop {r0}
	bx r0
	.align 2, 0
_08035120: .4byte 0x08B85854
