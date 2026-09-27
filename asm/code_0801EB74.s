	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801EB74
sub_0801EB74: @ 0x0801EB74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801EBFC @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0801EC00 @ =0x0202BBB8
	adds r1, r0, #0
	adds r1, #0x3a
	ldrb r2, [r1]
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r2, [r1]
	adds r0, #0x3b
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _0801EC04 @ =0x08B9372C
	bl Proc_Find
	cmp r0, #0
	bne _0801EBF6
	ldr r0, _0801EC08 @ =0x08B9376C
	bl Proc_Find
	cmp r0, #0
	bne _0801EBF6
	ldr r0, _0801EC0C @ =0x08B9378C
	bl Proc_Find
	cmp r0, #0
	bne _0801EBF6
	bl ClearUi
	movs r0, #0
	bl SetOnVMatch
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r4, #0
	bl Proc_Break
_0801EBF6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801EBFC: .4byte 0x03002870
_0801EC00: .4byte 0x0202BBB8
_0801EC04: .4byte 0x08B9372C
_0801EC08: .4byte 0x08B9376C
_0801EC0C: .4byte 0x08B9378C
