	.include "macro.inc"

	.syntax unified

	thumb_func_start ArchiveCurrentPalettes
ArchiveCurrentPalettes: @ 0x080136AC
	push {r4, r5, lr}
	bl GetPalFadeSt
	ldr r3, _080136F4 @ =0x02022860
	movs r1, #0
_080136B6:
	adds r5, r0, #0
	adds r5, #0x30
	adds r4, r1, #1
	adds r1, r0, #0
	movs r2, #0xf
_080136C0:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _080136C0
	adds r0, r5, #0
	adds r1, r4, #0
	cmp r1, #0x1f
	ble _080136B6
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	bl SetPalFadeStClkEnd1
	adds r0, r4, #0
	bl SetPalFadeStClkEnd2
	adds r0, r4, #0
	bl SetPalFadeStClkEnd3
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080136F4: .4byte 0x02022860
