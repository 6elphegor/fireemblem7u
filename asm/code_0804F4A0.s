	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxHPBarColorChangeMain
EfxHPBarColorChangeMain: @ 0x0804F4A0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _0804F588
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0804F4C6
	str r0, [r4, #0x54]
_0804F4C6:
	adds r0, r4, #0
	adds r0, #0x2e
	adds r1, r4, #0
	adds r1, #0x4c
	ldr r2, [r4, #0x50]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0804F4DE
	str r0, [r4, #0x58]
_0804F4DE:
	ldr r0, _0804F508 @ =0x0203E0B8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _0804F51C
	ldr r2, _0804F50C @ =0x0201F93C
	ldr r3, _0804F510 @ =0x0201F96C
	ldr r5, _0804F514 @ =0x0201F99C
	ldr r0, _0804F518 @ =0x02022BC0
	movs r1, #0x10
	str r1, [sp]
	ldr r1, [r4, #0x54]
	str r1, [sp, #4]
	movs r1, #5
	str r1, [sp, #8]
	adds r1, r2, #0
	adds r2, r3, #0
	adds r3, r5, #0
	bl EfxDecodeSplitedPalette
	b _0804F52C
	.align 2, 0
_0804F508: .4byte 0x0203E0B8
_0804F50C: .4byte 0x0201F93C
_0804F510: .4byte 0x0201F96C
_0804F514: .4byte 0x0201F99C
_0804F518: .4byte 0x02022BC0
_0804F51C:
	ldr r0, [r4, #0x58]
	lsls r0, r0, #5
	ldr r1, _0804F558 @ =0x081D9730
	adds r0, r0, r1
	ldr r1, _0804F55C @ =0x02022BC0
	movs r2, #8
	bl CpuFastSet
_0804F52C:
	ldr r0, _0804F560 @ =0x0203E0B8
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _0804F574
	ldr r2, _0804F564 @ =0x0201F9FC
	ldr r3, _0804F568 @ =0x0201FA2C
	ldr r5, _0804F56C @ =0x0201FA5C
	ldr r0, _0804F570 @ =0x02022BE0
	movs r1, #0x10
	str r1, [sp]
	ldr r1, [r4, #0x54]
	str r1, [sp, #4]
	movs r1, #5
	str r1, [sp, #8]
	adds r1, r2, #0
	adds r2, r3, #0
	adds r3, r5, #0
	bl EfxDecodeSplitedPalette
	b _0804F584
	.align 2, 0
_0804F558: .4byte 0x081D9730
_0804F55C: .4byte 0x02022BC0
_0804F560: .4byte 0x0203E0B8
_0804F564: .4byte 0x0201F9FC
_0804F568: .4byte 0x0201FA2C
_0804F56C: .4byte 0x0201FA5C
_0804F570: .4byte 0x02022BE0
_0804F574:
	ldr r0, [r4, #0x58]
	lsls r0, r0, #5
	ldr r1, _0804F590 @ =0x081D9730
	adds r0, r0, r1
	ldr r1, _0804F594 @ =0x02022BE0
	movs r2, #8
	bl CpuFastSet
_0804F584:
	bl EnablePalSync
_0804F588:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804F590: .4byte 0x081D9730
_0804F594: .4byte 0x02022BE0
