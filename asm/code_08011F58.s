	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_WarpLoadUnits
EvtCmd_WarpLoadUnits: @ 0x08011F58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08011FA4 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08011FA8 @ =0x08B92414
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	str r0, [r2, #0x54]
	movs r3, #0
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08011F94
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08011F96
_08011F94:
	movs r3, #1
_08011F96:
	adds r0, r2, #0
	adds r0, #0x64
	strh r3, [r0]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08011FA4: .4byte 0x0202E3F4
_08011FA8: .4byte 0x08B92414
