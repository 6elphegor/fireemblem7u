	.include "macro.inc"

	.syntax unified

	thumb_func_start Tactician_MoveHand
Tactician_MoveHand: @ 0x0803F584
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	lsls r5, r1, #1
	adds r2, #0x36
	adds r2, r2, r5
	ldrh r4, [r2]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #6
	ldr r6, _0803F5D8 @ =0x081D3C0C
	adds r2, r0, r6
	adds r1, r7, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r3, r0, #2
	adds r0, r2, r3
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803F5CE
	adds r1, r5, #0
	adds r5, r6, #0
_0803F5B4:
	adds r0, r2, #0
	adds r0, #0x36
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #6
	adds r2, r0, r5
	adds r0, r2, r3
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803F5B4
_0803F5CE:
	strh r4, [r7, #0x34]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F5D8: .4byte 0x081D3C0C
