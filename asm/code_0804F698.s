	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxStatusUnit
NewEfxStatusUnit: @ 0x0804F698
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0804F6B0
	ldr r0, _0804F6AC @ =0x0203E094
	b _0804F6B2
	.align 2, 0
_0804F6AC: .4byte 0x0203E094
_0804F6B0:
	ldr r0, _0804F738 @ =0x0203E098
_0804F6B2:
	ldr r6, [r0]
	ldr r0, _0804F73C @ =0x08B9AF14
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	str r5, [r4, #0x5c]
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	ldr r0, _0804F740 @ =0x081D83E4
	str r0, [r4, #0x48]
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	str r0, [r4, #0x4c]
	ldr r0, _0804F744 @ =0x0203E008
	ldrh r0, [r0]
	cmp r0, #1
	bne _0804F6E4
	str r1, [r4, #0x4c]
_0804F6E4:
	str r1, [r4, #0x50]
	strh r1, [r4, #0x36]
	strh r1, [r4, #0x34]
	strh r1, [r4, #0x32]
	adds r0, r5, #0
	bl GetAnimPosition
	ldr r1, _0804F748 @ =0x0201776C
	lsls r0, r0, #2
	adds r0, r0, r1
	str r4, [r0]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0804F754
	ldr r5, _0804F74C @ =0x02000054
	ldr r0, [r5]
	ldr r4, _0804F750 @ =0x02022260
	adds r1, r4, #0
	movs r2, #0x10
	bl EfxSplitColor
	ldr r0, [r5]
	adds r5, r4, #0
	adds r5, #0x30
	adds r1, r5, #0
	movs r2, #0x10
	bl EfxSplitColorPetrify
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r2, r4, r0
	movs r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0x10
	bl sub_080671AC
	b _0804F784
	.align 2, 0
_0804F738: .4byte 0x0203E098
_0804F73C: .4byte 0x08B9AF14
_0804F740: .4byte 0x081D83E4
_0804F744: .4byte 0x0203E008
_0804F748: .4byte 0x0201776C
_0804F74C: .4byte 0x02000054
_0804F750: .4byte 0x02022260
_0804F754:
	ldr r5, _0804F78C @ =0x02000054
	ldr r0, [r5, #4]
	ldr r4, _0804F790 @ =0x020222C0
	adds r1, r4, #0
	movs r2, #0x10
	bl EfxSplitColor
	ldr r0, [r5, #4]
	adds r5, r4, #0
	adds r5, #0x30
	adds r1, r5, #0
	movs r2, #0x10
	bl EfxSplitColorPetrify
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r2, r4, r0
	movs r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0x10
	bl sub_080671AC
_0804F784:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F78C: .4byte 0x02000054
_0804F790: .4byte 0x020222C0
