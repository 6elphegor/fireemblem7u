	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F36C
sub_0800F36C: @ 0x0800F36C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r7, [r0, #4]
	ldr r2, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F38C
	ldr r4, _0800F388 @ =0x0000FFFF
	ands r4, r2
	b _0800F390
	.align 2, 0
_0800F388: .4byte 0x0000FFFF
_0800F38C:
	movs r4, #1
	rsbs r4, r4, #0
_0800F390:
	ldr r2, [r3, #0x30]
	ldrh r1, [r2, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r6, #1
	rsbs r6, r6, #0
	cmp r0, #0
	bne _0800F3A4
	adds r6, r1, #0
_0800F3A4:
	ldr r5, [r2, #0xc]
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F3CC
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_080B5554
	adds r0, r5, #0
	bl sub_080B55BC
	movs r0, #2
	b _0800F3CE
_0800F3CC:
	movs r0, #0
_0800F3CE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
