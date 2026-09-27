	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801060C
sub_0801060C: @ 0x0801060C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	movs r1, #0
	ldrsh r3, [r0, r1]
	ldr r0, _08010660 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r3
	mov r1, ip
	adds r1, #0x44
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r4, [r0]
	cmp r3, #0x10
	bne _0801065A
	ldr r0, _08010664 @ =0x08B91EDC
	bl Proc_Find
	bl Proc_End
	adds r0, r5, #0
	bl Proc_Break
_0801065A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010660: .4byte 0x03002870
_08010664: .4byte 0x08B91EDC
