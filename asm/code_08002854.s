	.include "macro.inc"

	.syntax unified

	thumb_func_start ColorFadeTick2
ColorFadeTick2: @ 0x08002854
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	movs r0, #0x1f
	str r0, [r7]
_0800285E:
	ldr r0, [r7]
	cmp r0, #0
	bge _08002866
	b _08002A60
_08002866:
	ldr r0, _08002878 @ =0x02022240
	ldr r1, [r7]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _0800287C
	b _08002A58
	.align 2, 0
_08002878: .4byte 0x02022240
_0800287C:
	movs r0, #0xf
	str r0, [r7, #4]
_08002880:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _08002888
	b _08002A58
_08002888:
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r1, [r7, #4]
	adds r0, r0, r1
	str r0, [r7, #0x10]
	ldr r0, _08002A4C @ =0x02022260
	ldr r1, [r7, #0x10]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r0, r0, r2
	ldr r1, _08002A4C @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r1, r1, r3
	ldr r2, _08002A50 @ =0x02022240
	ldr r3, [r7]
	adds r2, r2, r3
	ldrb r1, [r1]
	ldrb r2, [r2]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08002A4C @ =0x02022260
	ldr r1, [r7, #0x10]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	adds r0, r0, r1
	ldr r1, _08002A4C @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r2, r3, #1
	adds r1, r1, r2
	ldr r2, _08002A50 @ =0x02022240
	ldr r3, [r7]
	adds r2, r2, r3
	ldrb r1, [r1]
	ldrb r2, [r2]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08002A4C @ =0x02022260
	ldr r1, [r7, #0x10]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08002A4C @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r2, r3, #2
	adds r1, r1, r2
	ldr r2, _08002A50 @ =0x02022240
	ldr r3, [r7]
	adds r2, r2, r3
	ldrb r1, [r1]
	ldrb r2, [r2]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	ldr r1, _08002A4C @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r1, r1, r3
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r1, #0
	subs r2, #0x20
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0x1f
	ble _0800296A
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0x1f
	strh r1, [r0]
_0800296A:
	adds r0, r7, #0
	adds r0, #8
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0
	bge _0800297E
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	strh r1, [r0]
_0800297E:
	adds r0, r7, #0
	adds r0, #0xa
	ldr r1, _08002A4C @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r2, r3, #1
	adds r1, r1, r2
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r1, #0
	subs r2, #0x20
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0xa
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0x1f
	ble _080029B2
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0x1f
	strh r1, [r0]
_080029B2:
	adds r0, r7, #0
	adds r0, #0xa
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0
	bge _080029C6
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	strh r1, [r0]
_080029C6:
	adds r0, r7, #0
	adds r0, #0xc
	ldr r1, _08002A4C @ =0x02022260
	ldr r2, [r7, #0x10]
	adds r4, r2, #0
	lsls r3, r4, #1
	adds r3, r3, r2
	adds r2, r3, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	adds r2, r1, #0
	subs r2, #0x20
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0x1f
	ble _080029FA
	adds r0, r7, #0
	adds r0, #0xc
	movs r1, #0x1f
	strh r1, [r0]
_080029FA:
	adds r0, r7, #0
	adds r0, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0
	bge _08002A0E
	adds r0, r7, #0
	adds r0, #0xc
	movs r1, #0
	strh r1, [r0]
_08002A0E:
	ldr r0, _08002A54 @ =0x02022860
	ldr r1, [r7, #0x10]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0xc
	ldrh r2, [r1]
	lsls r1, r2, #0xa
	adds r2, r7, #0
	adds r2, #0xa
	ldrh r3, [r2]
	lsls r2, r3, #5
	adds r1, r1, r2
	adds r2, r7, #0
	adds r2, #8
	ldrh r2, [r2]
	adds r1, r1, r2
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _08002880
	.align 2, 0
_08002A4C: .4byte 0x02022260
_08002A50: .4byte 0x02022240
_08002A54: .4byte 0x02022860
_08002A58:
	ldr r0, [r7]
	subs r1, r0, #1
	str r1, [r7]
	b _0800285E
_08002A60:
	bl EnablePalSync
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
