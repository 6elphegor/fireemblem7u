	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxOverrideBgm
EfxOverrideBgm: @ 0x0806768C
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r1, _080676B0 @ =0x0202BBB8
	movs r0, #0x20
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080676AA
	adds r0, r2, #0
	bl SetBgmVolume
	adds r0, r4, #0
	bl OverrideBgm
_080676AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080676B0: .4byte 0x0202BBB8
