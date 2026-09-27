	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08050918
sub_08050918: @ 0x08050918
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r2, _08050968 @ =0x02000028
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r6, _0805096C @ =0x0201FB00
	ldr r0, [r6]
	subs r1, r1, r0
	ldr r3, _08050970 @ =0x0200002C
	movs r5, #2
	ldrsh r4, [r2, r5]
	subs r4, r4, r0
	movs r0, #2
	ldrsh r5, [r3, r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	ldrsh r2, [r3, r0]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetEkrFrontAnimPostion
	ldr r0, _08050974 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08050978
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	b _08050986
	.align 2, 0
_08050968: .4byte 0x02000028
_0805096C: .4byte 0x0201FB00
_08050970: .4byte 0x0200002C
_08050974: .4byte 0x0203E02C
_08050978:
	cmp r0, #0
	blt _08050986
	cmp r0, #2
	bgt _08050986
	ldr r0, [r6]
	bl sub_0804E6DC
_08050986:
	adds r0, r7, #0
	bl Proc_Break
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
