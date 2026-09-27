	.include "macro.inc"

	.syntax unified

	thumb_func_start CpPerform_EquipBest
CpPerform_EquipBest: @ 0x080357EC
	push {r4, r5, r6, lr}
	sub sp, #0x18
	bl AiCanEquip
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803582A
	add r0, sp, #4
	bl AiEquipGetFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803582A
	ldr r1, _08035834 @ =0x0203A97C
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	add r4, sp, #0x10
	mov r5, sp
	adds r5, #0x12
	add r6, sp, #0x14
	str r6, [sp]
	adds r2, r4, #0
	adds r3, r5, #0
	bl AiEquipGetDanger
	ldrh r0, [r4]
	ldrh r1, [r5]
	ldrh r2, [r6]
	add r3, sp, #4
	bl AiEquipBestConsideringDanger
_0803582A:
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035834: .4byte 0x0203A97C
