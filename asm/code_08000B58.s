	.include "macro.inc"

	.syntax unified

	thumb_func_start IrqInit
IrqInit: @ 0x08000B58
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_08000B62:
	ldr r0, [r7]
	cmp r0, #0xd
	ble _08000B6A
	b _08000B88
_08000B6A:
	ldr r0, _08000B80 @ =0x030028E0
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08000B84 @ =DummyIrqRoutine
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08000B62
	.align 2, 0
_08000B80: .4byte 0x030028E0
_08000B84: .4byte DummyIrqRoutine
_08000B88:
	ldr r0, _08000BA4 @ =IrqMain
	ldr r1, _08000BA8 @ =0x03003950
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
	ldr r0, _08000BAC @ =0x03007FFC
	ldr r1, _08000BA8 @ =0x03003950
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000BA4: .4byte IrqMain
_08000BA8: .4byte 0x03003950
_08000BAC: .4byte 0x03007FFC
