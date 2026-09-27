	.include "macro.inc"

	.syntax unified

	thumb_func_start ReadSaveBlockInfo
ReadSaveBlockInfo: @ 0x0809E6FC
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _0809E70A
	mov r4, sp
_0809E70A:
	ldr r2, _0809E738 @ =0x03005E70
	ldr r0, _0809E73C @ =0x08CE3B58
	lsls r1, r5, #4
	adds r1, #0x64
	ldr r0, [r0]
	adds r0, r0, r1
	ldr r3, [r2]
	adds r1, r4, #0
	movs r2, #0x10
	bl _call_via_r3
	ldr r0, _0809E740 @ =0x0000200A
	ldrh r1, [r4, #4]
	cmp r1, r0
	bne _0809E794
	cmp r5, #6
	bhi _0809E794
	lsls r0, r5, #2
	ldr r1, _0809E744 @ =_0809E748
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809E738: .4byte 0x03005E70
_0809E73C: .4byte 0x08CE3B58
_0809E740: .4byte 0x0000200A
_0809E744: .4byte _0809E748
_0809E748: @ jump table
	.4byte _0809E764 @ case 0
	.4byte _0809E764 @ case 1
	.4byte _0809E764 @ case 2
	.4byte _0809E76C @ case 3
	.4byte _0809E76C @ case 4
	.4byte _0809E774 @ case 5
	.4byte _0809E77C @ case 6
_0809E764:
	ldr r1, _0809E768 @ =0x00011217
	b _0809E77E
	.align 2, 0
_0809E768: .4byte 0x00011217
_0809E76C:
	ldr r1, _0809E770 @ =0x00020509
	b _0809E77E
	.align 2, 0
_0809E770: .4byte 0x00020509
_0809E774:
	ldr r1, _0809E778 @ =0x00020112
	b _0809E77E
	.align 2, 0
_0809E778: .4byte 0x00020112
_0809E77C:
	ldr r1, _0809E790 @ =0x00020223
_0809E77E:
	ldr r0, [r4]
	cmp r0, r1
	bne _0809E794
	adds r0, r4, #0
	bl VerifySaveBlockChecksum
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0809E796
	.align 2, 0
_0809E790: .4byte 0x00020223
_0809E794:
	movs r0, #0
_0809E796:
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
