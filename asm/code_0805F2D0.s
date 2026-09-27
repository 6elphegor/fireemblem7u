	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805F2D0
sub_0805F2D0: @ 0x0805F2D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805F36C
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805F320
	ldr r0, [r5, #0x5c]
	movs r4, #2
	ldrsh r3, [r0, r4]
	ldr r4, _0805F31C @ =0x08BA3758
	movs r6, #0x30
	ldrsh r2, [r5, r6]
	lsls r1, r2, #1
	adds r1, r1, r4
	movs r6, #0
	ldrsh r1, [r1, r6]
	adds r6, r3, r1
	movs r1, #4
	ldrsh r3, [r0, r1]
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r1, [r2, r4]
	adds r2, r3, r1
	adds r1, r6, #0
	bl StartSubSpell_efxShineOBJ
	b _0805F34C
	.align 2, 0
_0805F31C: .4byte 0x08BA3758
_0805F320:
	ldr r0, [r5, #0x5c]
	movs r6, #2
	ldrsh r3, [r0, r6]
	ldr r4, _0805F374 @ =0x08BA3758
	movs r1, #0x30
	ldrsh r2, [r5, r1]
	lsls r1, r2, #1
	adds r1, r1, r4
	movs r6, #0
	ldrsh r1, [r1, r6]
	subs r6, r3, r1
	movs r1, #4
	ldrsh r3, [r0, r1]
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r1, [r2, r4]
	adds r2, r3, r1
	adds r1, r6, #0
	bl StartSubSpell_efxShineOBJ
_0805F34C:
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldrh r0, [r5, #0x30]
	adds r0, #2
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _0805F36C
	ldr r1, _0805F378 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0805F36C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805F374: .4byte 0x08BA3758
_0805F378: .4byte 0x0201774C
