	.include "macro.inc"

	.syntax unified

	thumb_func_start CpPerform_WaitAction
CpPerform_WaitAction: @ 0x08035714
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08035738
	adds r0, r4, #0
	bl Proc_Break
_08035738:
	ldr r3, _08035750 @ =0x03004690
	ldr r1, [r3]
	ldr r2, _08035754 @ =0x0203A97C
	ldrb r0, [r2, #2]
	strb r0, [r1, #0x10]
	ldr r1, [r3]
	ldrb r0, [r2, #3]
	strb r0, [r1, #0x11]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035750: .4byte 0x03004690
_08035754: .4byte 0x0203A97C
