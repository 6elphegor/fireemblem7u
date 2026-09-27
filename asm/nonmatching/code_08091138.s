	.include "macro.inc"

	.syntax unified

	thumb_func_start SomethingPrepListRelated
SomethingPrepListRelated: @ 0x08091138
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sl, r1
	mov sb, r2
	ldr r6, _08091200 @ =0x020117E4
	ldr r1, _08091204 @ =0x02012464
	movs r0, #0
	strh r0, [r1]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080911B2
	movs r5, #1
_0809115A:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	adds r7, r5, #1
	cmp r4, #0
	beq _080911AC
	ldr r0, [r4]
	cmp r0, #0
	beq _080911AC
	ldr r0, [r4, #0xc]
	ldr r1, _08091208 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080911AC
	cmp r4, r8
	beq _080911AC
	adds r0, r4, #0
	bl GetUnitItemCount
	adds r5, r0, #0
	movs r2, #0
	cmp r2, r5
	bge _080911AC
	ldr r3, _08091204 @ =0x02012464
	adds r1, r4, #0
	adds r1, #0x1e
_08091190:
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	strb r0, [r6]
	ldrh r0, [r1]
	strh r0, [r6, #2]
	strb r2, [r6, #1]
	adds r6, #4
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r1, #2
	adds r2, #1
	cmp r2, r5
	blt _08091190
_080911AC:
	adds r5, r7, #0
	cmp r5, #0x3f
	ble _0809115A
_080911B2:
	movs r0, #1
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	beq _080911EC
	bl GetConvoyItemArray
	adds r1, r0, #0
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0
	beq _080911EC
	movs r4, #0
	ldr r3, _08091204 @ =0x02012464
_080911CE:
	ldrh r0, [r1]
	strh r0, [r6, #2]
	strb r4, [r6]
	strb r2, [r6, #1]
	adds r6, #4
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x63
	bgt _080911EC
	ldrh r0, [r1]
	cmp r0, #0
	bne _080911CE
_080911EC:
	mov r0, sl
	bl sub_08090F9C
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091200: .4byte 0x020117E4
_08091204: .4byte 0x02012464
_08091208: .4byte 0x00010004
