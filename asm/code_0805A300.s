	.include "macro.inc"

	.syntax unified

	thumb_func_start efxPurgeOBJRND_Loop
efxPurgeOBJRND_Loop: @ 0x0805A300
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x44]
	cmp r0, r1
	ble _0805A35C
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r2, _0805A364 @ =0x08BA27E8
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r1, r0, #3
	adds r1, r1, r2
	ldr r4, [r1]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	ldr r0, [r5, #0x60]
	adds r1, r4, #0
	bl StartSubSpell_efxPurgeOBJ
	adds r0, r4, #0
	movs r1, #1
	bl sub_0805A094
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x48]
	cmp r0, r1
	ble _0805A35C
	ldr r1, _0805A368 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0805A35C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A364: .4byte 0x08BA27E8
_0805A368: .4byte 0x0201774C
