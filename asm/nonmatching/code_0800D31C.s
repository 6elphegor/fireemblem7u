	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_WaitForMovement
EvtCmd_WaitForMovement: @ 0x0800D31C
	push {r4, lr}
	adds r4, r0, #0
	bl MuExistsActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D32E
	movs r0, #3
	b _0800D352
_0800D32E:
	ldr r0, _0800D34C @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D350
	movs r0, #2
	b _0800D352
	.align 2, 0
_0800D34C: .4byte 0x0202E3F4
_0800D350:
	movs r0, #0
_0800D352:
	pop {r4}
	pop {r1}
	bx r1
