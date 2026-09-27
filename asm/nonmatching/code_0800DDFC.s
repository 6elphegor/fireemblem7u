	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_PutCursor
EvtCmd_PutCursor: @ 0x0800DDFC
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DE12
	movs r0, #0
	b _0800DE56
_0800DE12:
	ldr r1, [r3, #0x30]
	ldr r2, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800DE26
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _0800DE28
_0800DE26:
	ldr r0, _0800DE3C @ =0x0000FFFF
_0800DE28:
	adds r5, r0, #0
	ldrh r1, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DE40
	adds r4, r1, #0
	b _0800DE42
	.align 2, 0
_0800DE3C: .4byte 0x0000FFFF
_0800DE40:
	ldr r4, _0800DE5C @ =0x0000FFFF
_0800DE42:
	ldr r0, _0800DE60 @ =0x08B91A50
	adds r1, r3, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x64
	strh r5, [r1]
	adds r0, #0x66
	strh r4, [r0]
	movs r0, #2
_0800DE56:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800DE5C: .4byte 0x0000FFFF
_0800DE60: .4byte 0x08B91A50
