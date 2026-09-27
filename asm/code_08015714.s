	.include "macro.inc"

	.syntax unified

	thumb_func_start HandleMoveMapCursor
HandleMoveMapCursor: @ 0x08015714
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _08015764 @ =0x0202BBB8
	ldrh r3, [r2, #0x20]
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	movs r5, #0x1c
	ldrsh r0, [r2, r5]
	cmp r1, r0
	bge _0801572C
	adds r0, r3, r4
	strh r0, [r2, #0x20]
_0801572C:
	ldrh r3, [r2, #0x20]
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	movs r5, #0x1c
	ldrsh r0, [r2, r5]
	cmp r1, r0
	ble _0801573E
	subs r0, r3, r4
	strh r0, [r2, #0x20]
_0801573E:
	ldrh r3, [r2, #0x22]
	movs r1, #0x22
	ldrsh r0, [r2, r1]
	movs r5, #0x1e
	ldrsh r1, [r2, r5]
	cmp r0, r1
	bge _08015750
	adds r0, r3, r4
	strh r0, [r2, #0x22]
_08015750:
	ldrh r3, [r2, #0x22]
	movs r5, #0x22
	ldrsh r0, [r2, r5]
	cmp r0, r1
	ble _0801575E
	subs r0, r3, r4
	strh r0, [r2, #0x22]
_0801575E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015764: .4byte 0x0202BBB8
