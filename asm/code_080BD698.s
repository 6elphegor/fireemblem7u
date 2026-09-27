	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BD698
sub_080BD698: @ 0x080BD698
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r2, [r4, #0x38]
	asrs r6, r2, #0xa
	mov r1, sp
	ldr r0, _080BD760 @ =0x0867735C
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _080BD756
	ldr r0, [r4, #0x3c]
	adds r0, r2, r0
	str r0, [r4, #0x38]
	cmp r0, #0
	bge _080BD6C8
	movs r0, #0
	str r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_Break
_080BD6C8:
	ldr r1, [r4, #0x38]
	asrs r1, r1, #0xa
	ldr r0, [r4, #0x34]
	subs r0, #0x14
	lsls r0, r0, #3
	cmp r1, r0
	ble _080BD6DC
	adds r0, r4, #0
	bl Proc_Break
_080BD6DC:
	ldr r0, [r4, #0x38]
	asrs r5, r0, #0xa
	cmp r6, r5
	beq _080BD756
	cmp r6, r5
	ble _080BD70A
	adds r2, r6, #0
	cmp r6, #0
	bge _080BD6F0
	adds r2, r6, #7
_080BD6F0:
	asrs r2, r2, #3
	adds r0, r5, #0
	cmp r5, #0
	bge _080BD6FA
	adds r0, r5, #7
_080BD6FA:
	asrs r0, r0, #3
	cmp r2, r0
	beq _080BD70A
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	subs r2, #1
	bl sub_080BD588
_080BD70A:
	cmp r6, r5
	bge _080BD73E
	adds r3, r6, #7
	adds r0, r3, #0
	cmp r3, #0
	bge _080BD71A
	adds r0, r6, #0
	adds r0, #0xe
_080BD71A:
	asrs r1, r0, #3
	adds r0, r5, #7
	cmp r0, #0
	bge _080BD724
	adds r0, #7
_080BD724:
	asrs r0, r0, #3
	cmp r1, r0
	beq _080BD73E
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	adds r2, r6, #0
	cmp r2, #0
	bge _080BD736
	adds r2, r3, #0
_080BD736:
	asrs r2, r2, #3
	adds r2, #0x14
	bl sub_080BD588
_080BD73E:
	ldr r0, [r4, #0x30]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	bl EnableBgSync
	ldrh r0, [r4, #0x30]
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	movs r1, #0
	bl SetBgOffset
_080BD756:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD760: .4byte 0x0867735C
