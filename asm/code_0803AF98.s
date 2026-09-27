	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803AF98
sub_0803AF98: @ 0x0803AF98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #0xc]
	movs r0, #0
	mov r8, r0
	mov sb, r0
	mov sl, r0
	ldr r1, _0803B088 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B078
	bl sub_08037460
	cmp r0, #2
	ble _0803B078
	ldr r0, _0803B08C @ =0x03004690
	ldr r0, [r0]
	bl sub_0803758C
	movs r0, #1
	rsbs r0, r0, #0
	bl GenerateMagicSealMap
	ldr r0, _0803B090 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803B050
_0803AFE0:
	ldr r0, _0803B090 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r5, #1
	cmp r4, #0
	blt _0803B04A
	lsls r6, r5, #2
_0803AFF0:
	ldr r0, _0803B094 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803B044
	ldr r0, _0803B098 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803B018
	ldr r0, _0803B09C @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803B044
_0803B018:
	ldr r0, _0803B0A0 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _0803B08C @ =0x03004690
	ldr r0, [r0]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	bl sub_080374AC
	cmp r0, r8
	ble _0803B044
	mov r8, r0
	mov sb, r4
	mov sl, r5
_0803B044:
	subs r4, #1
	cmp r4, #0
	bge _0803AFF0
_0803B04A:
	adds r5, r7, #0
	cmp r5, #0
	bge _0803AFE0
_0803B050:
	mov r3, r8
	cmp r3, #1
	ble _0803B078
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp, #0xc]
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	movs r3, #0
	bl AiSetDecision
_0803B078:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B088: .4byte 0x0203A8EC
_0803B08C: .4byte 0x03004690
_0803B090: .4byte 0x0202E3D8
_0803B094: .4byte 0x0202E3E4
_0803B098: .4byte 0x0202E3DC
_0803B09C: .4byte 0x0202BD48
_0803B0A0: .4byte 0x0202E3E8
