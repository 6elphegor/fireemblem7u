	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragonBg3HfScroll_Loop
EkrDragonBg3HfScroll_Loop: @ 0x08065E54
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08065E6C @ =0x0201FDAC
	ldr r0, [r1]
	cmp r0, #1
	bne _08065E78
	movs r0, #0
	str r0, [r1]
	ldr r1, _08065E70 @ =0x0201FDB0
	ldr r0, _08065E74 @ =0x0201FDB8
	b _08065E80
	.align 2, 0
_08065E6C: .4byte 0x0201FDAC
_08065E70: .4byte 0x0201FDB0
_08065E74: .4byte 0x0201FDB8
_08065E78:
	movs r0, #1
	str r0, [r1]
	ldr r1, _08065EAC @ =0x0201FDB0
	ldr r0, _08065EB0 @ =0x0201FEF8
_08065E80:
	str r0, [r1]
	adds r0, r1, #0
	ldr r1, _08065EB4 @ =0x0201FDB4
	ldr r0, [r0]
	str r0, [r1]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bne _08065EA6
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
_08065EA6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065EAC: .4byte 0x0201FDB0
_08065EB0: .4byte 0x0201FEF8
_08065EB4: .4byte 0x0201FDB4
