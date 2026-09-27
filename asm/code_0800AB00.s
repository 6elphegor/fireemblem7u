	.include "macro.inc"

	.syntax unified

	thumb_func_start PopupProc_MaybeResetVolume
PopupProc_MaybeResetVolume: @ 0x0800AB00
	push {lr}
	adds r3, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800AB18
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x10
	bl StartBgmVolumeChange
_0800AB18:
	pop {r0}
	bx r0
