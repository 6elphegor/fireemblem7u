	.include "macro.inc"

	.syntax unified

	thumb_func_start PopupProc_MaybeSetVolume
PopupProc_MaybeSetVolume: @ 0x0800AABC
	push {lr}
	adds r3, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800AAD4
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	movs r2, #0x10
	bl StartBgmVolumeChange
_0800AAD4:
	pop {r0}
	bx r0
