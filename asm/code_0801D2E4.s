	.include "macro.inc"

	.syntax unified

	thumb_func_start TrySetCursorOn
TrySetCursorOn: @ 0x0801D2E4
	push {r4, lr}
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0801D312
	ldr r0, [r4]
	cmp r0, #0
	beq _0801D312
	ldr r0, [r4, #0xc]
	ldr r1, _0801D318 @ =0x00010007
	ands r0, r1
	cmp r0, #0
	bne _0801D312
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _0801D312
	cmp r1, #2
	bne _0801D31C
_0801D312:
	movs r0, #0
	b _0801D346
	.align 2, 0
_0801D318: .4byte 0x00010007
_0801D31C:
	ldr r0, _0801D34C @ =0x08B93374
	bl Proc_Find
	cmp r0, #0
	bne _0801D32C
	ldr r0, _0801D350 @ =0x08B96460
	bl Proc_Find
_0801D32C:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	bl EnsureCameraOntoPosition
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl SetMapCursorPosition
	movs r0, #1
_0801D346:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801D34C: .4byte 0x08B93374
_0801D350: .4byte 0x08B96460
